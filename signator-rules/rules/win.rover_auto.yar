rule win_rover_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.rover."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.rover"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { 7452 f644240c0f 744b 68???????? 57 e8???????? 83c408 }
            // n = 7, score = 100
            //   7452                 | je                  0x54
            //   f644240c0f           | test                byte ptr [esp + 0xc], 0xf
            //   744b                 | je                  0x4d
            //   68????????           |                     
            //   57                   | push                edi
            //   e8????????           |                     
            //   83c408               | add                 esp, 8

        $sequence_1 = { 50 ff15???????? 85c0 0f8402010000 ff15???????? 85db 7451 }
            // n = 7, score = 100
            //   50                   | push                eax
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   0f8402010000         | je                  0x108
            //   ff15????????         |                     
            //   85db                 | test                ebx, ebx
            //   7451                 | je                  0x53

        $sequence_2 = { 75f2 6a04 57 ff15???????? 8bd8 83c408 85db }
            // n = 7, score = 100
            //   75f2                 | jne                 0xfffffff4
            //   6a04                 | push                4
            //   57                   | push                edi
            //   ff15????????         |                     
            //   8bd8                 | mov                 ebx, eax
            //   83c408               | add                 esp, 8
            //   85db                 | test                ebx, ebx

        $sequence_3 = { 85db 7e2b 8b0e 8b5104 8a4c3230 8d0432 8b4028 }
            // n = 7, score = 100
            //   85db                 | test                ebx, ebx
            //   7e2b                 | jle                 0x2d
            //   8b0e                 | mov                 ecx, dword ptr [esi]
            //   8b5104               | mov                 edx, dword ptr [ecx + 4]
            //   8a4c3230             | mov                 cl, byte ptr [edx + esi + 0x30]
            //   8d0432               | lea                 eax, [edx + esi]
            //   8b4028               | mov                 eax, dword ptr [eax + 0x28]

        $sequence_4 = { c7442438ffffffff eb09 897c2438 83ffff 7561 837c2418ff 7539 }
            // n = 7, score = 100
            //   c7442438ffffffff     | mov                 dword ptr [esp + 0x38], 0xffffffff
            //   eb09                 | jmp                 0xb
            //   897c2438             | mov                 dword ptr [esp + 0x38], edi
            //   83ffff               | cmp                 edi, -1
            //   7561                 | jne                 0x63
            //   837c2418ff           | cmp                 dword ptr [esp + 0x18], -1
            //   7539                 | jne                 0x3b

        $sequence_5 = { a3???????? 8935???????? 8935???????? 8935???????? b9???????? c644241802 e8???????? }
            // n = 7, score = 100
            //   a3????????           |                     
            //   8935????????         |                     
            //   8935????????         |                     
            //   8935????????         |                     
            //   b9????????           |                     
            //   c644241802           | mov                 byte ptr [esp + 0x18], 2
            //   e8????????           |                     

        $sequence_6 = { 0fb7742418 33db eb0d 3d40270000 7405 83f80d 7555 }
            // n = 7, score = 100
            //   0fb7742418           | movzx               esi, word ptr [esp + 0x18]
            //   33db                 | xor                 ebx, ebx
            //   eb0d                 | jmp                 0xf
            //   3d40270000           | cmp                 eax, 0x2740
            //   7405                 | je                  7
            //   83f80d               | cmp                 eax, 0xd
            //   7555                 | jne                 0x57

        $sequence_7 = { 3bc7 7410 8b4e14 2bc8 51 50 8d4e08 }
            // n = 7, score = 100
            //   3bc7                 | cmp                 eax, edi
            //   7410                 | je                  0x12
            //   8b4e14               | mov                 ecx, dword ptr [esi + 0x14]
            //   2bc8                 | sub                 ecx, eax
            //   51                   | push                ecx
            //   50                   | push                eax
            //   8d4e08               | lea                 ecx, [esi + 8]

        $sequence_8 = { f7d8 1bc0 f7d0 25???????? 68???????? 57 8944243c }
            // n = 7, score = 100
            //   f7d8                 | neg                 eax
            //   1bc0                 | sbb                 eax, eax
            //   f7d0                 | not                 eax
            //   25????????           |                     
            //   68????????           |                     
            //   57                   | push                edi
            //   8944243c             | mov                 dword ptr [esp + 0x3c], eax

        $sequence_9 = { 53 e8???????? 83c40c 85c0 0f85a00b0000 39442438 }
            // n = 6, score = 100
            //   53                   | push                ebx
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   85c0                 | test                eax, eax
            //   0f85a00b0000         | jne                 0xba6
            //   39442438             | cmp                 dword ptr [esp + 0x38], eax

    condition:
        7 of them and filesize < 704512
}