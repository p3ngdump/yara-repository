rule win_chinad_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.chinad."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.chinad"
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
        $sequence_0 = { 8bc2 c1c806 33c8 8bc3 038df0feffff 33c6 23c2 }
            // n = 7, score = 200
            //   8bc2                 | mov                 eax, edx
            //   c1c806               | ror                 eax, 6
            //   33c8                 | xor                 ecx, eax
            //   8bc3                 | mov                 eax, ebx
            //   038df0feffff         | add                 ecx, dword ptr [ebp - 0x110]
            //   33c6                 | xor                 eax, esi
            //   23c2                 | and                 eax, edx

        $sequence_1 = { 8b55f8 52 e8???????? 83c408 8945f0 8b45f8 8945e4 }
            // n = 7, score = 200
            //   8b55f8               | mov                 edx, dword ptr [ebp - 8]
            //   52                   | push                edx
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   8945f0               | mov                 dword ptr [ebp - 0x10], eax
            //   8b45f8               | mov                 eax, dword ptr [ebp - 8]
            //   8945e4               | mov                 dword ptr [ebp - 0x1c], eax

        $sequence_2 = { 8d85f4fbffff 50 6a02 8b8df8fbffff 51 ff15???????? }
            // n = 6, score = 200
            //   8d85f4fbffff         | lea                 eax, [ebp - 0x40c]
            //   50                   | push                eax
            //   6a02                 | push                2
            //   8b8df8fbffff         | mov                 ecx, dword ptr [ebp - 0x408]
            //   51                   | push                ecx
            //   ff15????????         |                     

        $sequence_3 = { 8bc6 c1e106 0acb 8b5d08 884b0f 8bca }
            // n = 6, score = 200
            //   8bc6                 | mov                 eax, esi
            //   c1e106               | shl                 ecx, 6
            //   0acb                 | or                  cl, bl
            //   8b5d08               | mov                 ebx, dword ptr [ebp + 8]
            //   884b0f               | mov                 byte ptr [ebx + 0xf], cl
            //   8bca                 | mov                 ecx, edx

        $sequence_4 = { ff75d8 ff75d0 e8???????? 03f0 8b4598 ffb574ffffff 13da }
            // n = 7, score = 200
            //   ff75d8               | push                dword ptr [ebp - 0x28]
            //   ff75d0               | push                dword ptr [ebp - 0x30]
            //   e8????????           |                     
            //   03f0                 | add                 esi, eax
            //   8b4598               | mov                 eax, dword ptr [ebp - 0x68]
            //   ffb574ffffff         | push                dword ptr [ebp - 0x8c]
            //   13da                 | adc                 ebx, edx

        $sequence_5 = { 81c2b5bcb034 c1c00a 03d1 8bce 0195c4feffff c1c90d 33c8 }
            // n = 7, score = 200
            //   81c2b5bcb034         | add                 edx, 0x34b0bcb5
            //   c1c00a               | rol                 eax, 0xa
            //   03d1                 | add                 edx, ecx
            //   8bce                 | mov                 ecx, esi
            //   0195c4feffff         | add                 dword ptr [ebp - 0x13c], edx
            //   c1c90d               | ror                 ecx, 0xd
            //   33c8                 | xor                 ecx, eax

        $sequence_6 = { 23de 8bf3 0bf0 8bc7 03f1 c1c007 8bcf }
            // n = 7, score = 200
            //   23de                 | and                 ebx, esi
            //   8bf3                 | mov                 esi, ebx
            //   0bf0                 | or                  esi, eax
            //   8bc7                 | mov                 eax, edi
            //   03f1                 | add                 esi, ecx
            //   c1c007               | rol                 eax, 7
            //   8bcf                 | mov                 ecx, edi

        $sequence_7 = { 8945fc 8b450c 56 8b7508 50 8d4584 50 }
            // n = 7, score = 200
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   56                   | push                esi
            //   8b7508               | mov                 esi, dword ptr [ebp + 8]
            //   50                   | push                eax
            //   8d4584               | lea                 eax, [ebp - 0x7c]
            //   50                   | push                eax

        $sequence_8 = { ff15???????? 8b4510 50 8d8df8feffff 51 e8???????? }
            // n = 6, score = 200
            //   ff15????????         |                     
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]
            //   50                   | push                eax
            //   8d8df8feffff         | lea                 ecx, [ebp - 0x108]
            //   51                   | push                ecx
            //   e8????????           |                     

        $sequence_9 = { 8b8de8dfffff 51 ff15???????? 83bdccdfffff00 740d 8b95ccdfffff 52 }
            // n = 7, score = 200
            //   8b8de8dfffff         | mov                 ecx, dword ptr [ebp - 0x2018]
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   83bdccdfffff00       | cmp                 dword ptr [ebp - 0x2034], 0
            //   740d                 | je                  0xf
            //   8b95ccdfffff         | mov                 edx, dword ptr [ebp - 0x2034]
            //   52                   | push                edx

    condition:
        7 of them and filesize < 598016
}