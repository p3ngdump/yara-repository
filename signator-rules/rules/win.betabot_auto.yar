rule win_betabot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.betabot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.betabot"
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
        $sequence_0 = { c645f601 0fb645f6 83f801 7507 33c0 e9???????? 8b45fc }
            // n = 7, score = 400
            //   c645f601             | mov                 byte ptr [ebp - 0xa], 1
            //   0fb645f6             | movzx               eax, byte ptr [ebp - 0xa]
            //   83f801               | cmp                 eax, 1
            //   7507                 | jne                 9
            //   33c0                 | xor                 eax, eax
            //   e9????????           |                     
            //   8b45fc               | mov                 eax, dword ptr [ebp - 4]

        $sequence_1 = { 6a10 8d45e8 50 e8???????? 6a10 58 668945e8 }
            // n = 7, score = 400
            //   6a10                 | push                0x10
            //   8d45e8               | lea                 eax, [ebp - 0x18]
            //   50                   | push                eax
            //   e8????????           |                     
            //   6a10                 | push                0x10
            //   58                   | pop                 eax
            //   668945e8             | mov                 word ptr [ebp - 0x18], ax

        $sequence_2 = { 8bec 33c0 394508 741e 39450c 7419 }
            // n = 6, score = 400
            //   8bec                 | mov                 ebp, esp
            //   33c0                 | xor                 eax, eax
            //   394508               | cmp                 dword ptr [ebp + 8], eax
            //   741e                 | je                  0x20
            //   39450c               | cmp                 dword ptr [ebp + 0xc], eax
            //   7419                 | je                  0x1b

        $sequence_3 = { 7507 8a450c 47 880411 41 3bce 7cec }
            // n = 7, score = 400
            //   7507                 | jne                 9
            //   8a450c               | mov                 al, byte ptr [ebp + 0xc]
            //   47                   | inc                 edi
            //   880411               | mov                 byte ptr [ecx + edx], al
            //   41                   | inc                 ecx
            //   3bce                 | cmp                 ecx, esi
            //   7cec                 | jl                  0xffffffee

        $sequence_4 = { 8b08 83ec10 8bfc 8d75c8 a5 a5 }
            // n = 6, score = 400
            //   8b08                 | mov                 ecx, dword ptr [eax]
            //   83ec10               | sub                 esp, 0x10
            //   8bfc                 | mov                 edi, esp
            //   8d75c8               | lea                 esi, [ebp - 0x38]
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]

        $sequence_5 = { ff15???????? 83f801 7c10 56 ff750c ff7508 57 }
            // n = 7, score = 400
            //   ff15????????         |                     
            //   83f801               | cmp                 eax, 1
            //   7c10                 | jl                  0x12
            //   56                   | push                esi
            //   ff750c               | push                dword ptr [ebp + 0xc]
            //   ff7508               | push                dword ptr [ebp + 8]
            //   57                   | push                edi

        $sequence_6 = { c6406001 56 57 8b7d08 6a05 59 8bf0 }
            // n = 7, score = 400
            //   c6406001             | mov                 byte ptr [eax + 0x60], 1
            //   56                   | push                esi
            //   57                   | push                edi
            //   8b7d08               | mov                 edi, dword ptr [ebp + 8]
            //   6a05                 | push                5
            //   59                   | pop                 ecx
            //   8bf0                 | mov                 esi, eax

        $sequence_7 = { 85c0 740d 6800400000 6aff ff15???????? }
            // n = 5, score = 400
            //   85c0                 | test                eax, eax
            //   740d                 | je                  0xf
            //   6800400000           | push                0x4000
            //   6aff                 | push                -1
            //   ff15????????         |                     

        $sequence_8 = { 40 8945e4 837de410 7315 8b45f8 0345e4 0fb600 }
            // n = 7, score = 400
            //   40                   | inc                 eax
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax
            //   837de410             | cmp                 dword ptr [ebp - 0x1c], 0x10
            //   7315                 | jae                 0x17
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   0345e4               | add                 eax, dword ptr [ebp - 0x1c]
            //   0fb600               | movzx               eax, byte ptr [eax]

        $sequence_9 = { 8d04b8 833800 7414 ff30 ff45fc e8???????? 8b460c }
            // n = 7, score = 400
            //   8d04b8               | lea                 eax, [eax + edi*4]
            //   833800               | cmp                 dword ptr [eax], 0
            //   7414                 | je                  0x16
            //   ff30                 | push                dword ptr [eax]
            //   ff45fc               | inc                 dword ptr [ebp - 4]
            //   e8????????           |                     
            //   8b460c               | mov                 eax, dword ptr [esi + 0xc]

    condition:
        7 of them and filesize < 835584
}