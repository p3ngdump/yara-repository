rule win_dnspionage_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.dnspionage."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.dnspionage"
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
        $sequence_0 = { 75f9 8bf2 2bf9 8d4e01 }
            // n = 4, score = 300
            //   75f9                 | jne                 0xfffffffb
            //   8bf2                 | mov                 esi, edx
            //   2bf9                 | sub                 edi, ecx
            //   8d4e01               | lea                 ecx, [esi + 1]

        $sequence_1 = { 668901 885102 83c103 894df0 }
            // n = 4, score = 300
            //   668901               | mov                 word ptr [ecx], ax
            //   885102               | mov                 byte ptr [ecx + 2], dl
            //   83c103               | add                 ecx, 3
            //   894df0               | mov                 dword ptr [ebp - 0x10], ecx

        $sequence_2 = { 81e7fffdffff f7460c00020000 7511 8b4620 85c0 740a }
            // n = 6, score = 300
            //   81e7fffdffff         | and                 edi, 0xfffffdff
            //   f7460c00020000       | test                dword ptr [esi + 0xc], 0x200
            //   7511                 | jne                 0x13
            //   8b4620               | mov                 eax, dword ptr [esi + 0x20]
            //   85c0                 | test                eax, eax
            //   740a                 | je                  0xc

        $sequence_3 = { 75ef 8d4201 57 50 }
            // n = 4, score = 300
            //   75ef                 | jne                 0xfffffff1
            //   8d4201               | lea                 eax, [edx + 1]
            //   57                   | push                edi
            //   50                   | push                eax

        $sequence_4 = { 8b06 85c0 7419 8b5608 8d0c10 8d5901 }
            // n = 6, score = 300
            //   8b06                 | mov                 eax, dword ptr [esi]
            //   85c0                 | test                eax, eax
            //   7419                 | je                  0x1b
            //   8b5608               | mov                 edx, dword ptr [esi + 8]
            //   8d0c10               | lea                 ecx, [eax + edx]
            //   8d5901               | lea                 ebx, [ecx + 1]

        $sequence_5 = { 6a00 e8???????? 50 babb010000 b9???????? e8???????? 83c420 }
            // n = 7, score = 300
            //   6a00                 | push                0
            //   e8????????           |                     
            //   50                   | push                eax
            //   babb010000           | mov                 edx, 0x1bb
            //   b9????????           |                     
            //   e8????????           |                     
            //   83c420               | add                 esp, 0x20

        $sequence_6 = { 83c408 8bd0 b9???????? e8???????? ba???????? }
            // n = 5, score = 300
            //   83c408               | add                 esp, 8
            //   8bd0                 | mov                 edx, eax
            //   b9????????           |                     
            //   e8????????           |                     
            //   ba????????           |                     

        $sequence_7 = { 7404 c640010a 015e08 85ff 0f8413010000 }
            // n = 5, score = 300
            //   7404                 | je                  6
            //   c640010a             | mov                 byte ptr [eax + 1], 0xa
            //   015e08               | add                 dword ptr [esi + 8], ebx
            //   85ff                 | test                edi, edi
            //   0f8413010000         | je                  0x119

        $sequence_8 = { 75f9 f30f7e05???????? 2bca 6a28 c745e400000000 660fd645ec }
            // n = 6, score = 300
            //   75f9                 | jne                 0xfffffffb
            //   f30f7e05????????     |                     
            //   2bca                 | sub                 ecx, edx
            //   6a28                 | push                0x28
            //   c745e400000000       | mov                 dword ptr [ebp - 0x1c], 0
            //   660fd645ec           | movq                qword ptr [ebp - 0x14], xmm0

        $sequence_9 = { 33c5 8945fc 8a4508 384120 7512 b001 8b4dfc }
            // n = 7, score = 300
            //   33c5                 | xor                 eax, ebp
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8a4508               | mov                 al, byte ptr [ebp + 8]
            //   384120               | cmp                 byte ptr [ecx + 0x20], al
            //   7512                 | jne                 0x14
            //   b001                 | mov                 al, 1
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]

    condition:
        7 of them and filesize < 786432
}